/*
Cleaning Data in SQL Queries
*/


Select *
From PortfolioProject..NashvilleHousing

--------------------------------------------------------------------------------------------------------------------------

-- Standardize Date Format

Select convert(date,SaleDate) SaleDate
From PortfolioProject..NashvilleHousing


 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select *,PropertyAddress
From PortfolioProject..NashvilleHousing
where PropertyAddress is null
order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
	on a.ParcelID =b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null


Update a
set PropertyAddress = isnull(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
	on a.ParcelID =b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null




--------------------------------------------------------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)


Select PropertyAddress
From PortfolioProject.dbo.NashvilleHousing

select 
	substring(PropertyAddress,1,charindex(',',PropertyAddress)-1) Address,
	substring(PropertyAddress,charindex(',',PropertyAddress) + 1, len(PropertyAddress)) Address
From PortfolioProject.dbo.NashvilleHousing

alter table PortfolioProject.dbo.NashvilleHousing
	add PropertySplitAddress Nvarchar(255);
	
Update PortfolioProject.dbo.NashvilleHousing
set PropertySplitAddress = substring(PropertyAddress,1,charindex(',',PropertyAddress)-1)

alter table PortfolioProject.dbo.NashvilleHousing
	add PropertySplitCity Nvarchar(255);

Update PortfolioProject.dbo.NashvilleHousing
set PropertySplitCity = substring(PropertyAddress,charindex(',',PropertyAddress) + 1, len(PropertyAddress))


select * 
from PortfolioProject.dbo.NashvilleHousing


select OwnerAddress
from PortfolioProject.dbo.NashvilleHousing



select
PARSENAME(replace(OwnerAddress, ',', '.'),3),
PARSENAME(replace(OwnerAddress, ',', '.'),2),
PARSENAME(replace(OwnerAddress, ',', '.'),1)
from PortfolioProject.dbo.NashvilleHousing

alter table PortfolioProject.dbo.NashvilleHousing
	add OwnerSplitAddress Nvarchar(255);
	
Update PortfolioProject.dbo.NashvilleHousing
set OwnerSplitAddress = PARSENAME(replace(OwnerAddress, ',', '.'),3)

alter table PortfolioProject.dbo.NashvilleHousing
	add OwnerSplitCity Nvarchar(255);

Update PortfolioProject.dbo.NashvilleHousing
set OwnerSplitCity = PARSENAME(replace(OwnerAddress, ',', '.'),2)

alter table PortfolioProject.dbo.NashvilleHousing
	add OwnerSplitState Nvarchar(255);
                                      
Update PortfolioProject.dbo.NashvilleHousing
set OwnerSplitCity = PARSENAME(replace(OwnerAddress, ',', '.'),2)




--------------------------------------------------------------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field


Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From PortfolioProject.dbo.NashvilleHousing
Group by SoldAsVacant
order by 2


Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From PortfolioProject.dbo.NashvilleHousing


Update PortfolioProject.dbo.NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END






-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- Remove Duplicates
with RowNumCTE as (
select *,
 ROW_NUMBER() over(
 partition by ParcelID,
			  PropertyAddress,
			  SalePrice,
			  SaleDate,
			  LegalReference
			  order by UniqueID) row_num
From PortfolioProject.dbo.NashvilleHousing
)
select * from RowNumCTE
where row_num >1
order by PropertyAddress



Select *
From PortfolioProject.dbo.NashvilleHousing




---------------------------------------------------------------------------------------------------------

-- Delete Unused Columns



Select *
From PortfolioProject.dbo.NashvilleHousing


ALTER TABLE PortfolioProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate















-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

--- Importing Data using OPENROWSET and BULK INSERT	

--  More advanced and looks cooler, but have to configure server appropriately to do correctly
--  Wanted to provide this in case you wanted to try it


--sp_configure 'show advanced options', 1;
--RECONFIGURE;
--GO
--sp_configure 'Ad Hoc Distributed Queries', 1;
--RECONFIGURE;
--GO


--USE PortfolioProject 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1 

--GO 

--EXEC master.dbo.sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1 

--GO 


---- Using BULK INSERT

--USE PortfolioProject;
--GO
--BULK INSERT nashvilleHousing FROM 'C:\Temp\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv'
--   WITH (
--      FIELDTERMINATOR = ',',
--      ROWTERMINATOR = '\n'
--);
--GO


---- Using OPENROWSET
--USE PortfolioProject;
--GO
--SELECT * INTO nashvilleHousing
--FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
--    'Excel 12.0; Database=C:\Users\alexf\OneDrive\Documents\SQL Server Management Studio\Nashville Housing Data for Data Cleaning Project.csv', [Sheet1$]);
--GO
