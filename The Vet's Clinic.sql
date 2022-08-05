-- Extract information on pets names and owner names side-by-side
SELECT
	O.Name AS Owner_Name,
	P.Name AS Pet_Name
FROM
	PortofolioProject.dbo.['P9-Owners$'] O
	JOIN
	PortofolioProject.dbo.['P9-Pets$'] P
	ON O.[OwnerID] = P.[OwnerID]
ORDER BY O.OwnerID ASC

-- Find out which pets from this clinic had procedures performed
SELECT
	PH.PetID,
	P.Kind,
	PH.ProcedureType AS Procedure_Performed
FROM
	PortofolioProject.dbo.['P9-ProceduresHistory$'] PH
	JOIN
	PortofolioProject.dbo.['P9-Pets$'] P
	ON PH.PetID = P.PetID
ORDER BY 
	P.Kind ASC

-- Match up all procedures performed to their description
SELECT DISTINCT
	PH.ProcedureType,
	PD.Description
FROM
	PortofolioProject.dbo.['P9-Pets$'] P
	JOIN
	PortofolioProject.dbo.['P9-ProceduresHistory$'] PH
	ON P.PetID = PH.PetID
	JOIN
	PortofolioProject.dbo.['P9-ProceduresDetails$'] PD
	ON PH.ProcedureType = PD.ProcedureType
ORDER BY
	PH.ProcedureType DESC

-- Same as above but only and pets from the clinic in question
SELECT DISTINCT
	P.Kind,
	PH.ProcedureType,
	PD.Description
FROM
	PortofolioProject.dbo.['P9-Pets$'] P
	JOIN
	PortofolioProject.dbo.['P9-ProceduresHistory$'] PH
	ON P.PetID = PH.PetID
	JOIN
	PortofolioProject.dbo.['P9-ProceduresDetails$'] PD
	ON PH.ProcedureType = PD.ProcedureType
ORDER BY
	P.Kind DESC

-- Extract a table of individual cost (procedure prices) 
-- incurred by owners of pets from the clinic in question (this table should have owners and procedures price side-by-side)
SELECT DISTINCT
	O.Name,
	PD.Price
FROM
	PortofolioProject.dbo.['P9-Owners$'] O
	JOIN
	PortofolioProject.dbo.['P9-Pets$'] P
	ON O.OwnerID = P.OwnerID
	JOIN
	PortofolioProject.dbo.['P9-ProceduresHistory$'] PH
	ON P.PetID = PH.PetID
	JOIN
	PortofolioProject.dbo.['P9-ProceduresDetails$'] PD
	ON PH.ProcedureType = PD.ProcedureType
ORDER BY
	O.Name ASC
