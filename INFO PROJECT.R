library(stringr)
library(dplyr)
library(ggplot2)

year_fire <- California_Fire_Perimeters_all_$YEAR_
setwd("/Users/dj/Desktop/12345")
df1 <- read.csv("California_Fire_Perimeters_(all).csv")
df2 <-  read.csv("NIFC_2023_Wildfire_Perimeters.csv")
df3 <- left_join(df1, df2, by = c("OBJECTID" = "OBJECTID",
                                    "FIRE_NAME" = "poly_IncidentName",
                                    "GIS_ACRES" = "poly_GISAcres"))
df3 <- df3 %>% select(-c(COMMENTS, COMPLEX_NAME, COMPLEX_INCNUM
                         , IRWINID, FIRE_NUM, poly_SourceOID, poly_FeatureCategory
                         ,poly_MapMethod, poly_CreateDate, poly_DateCurrent
                         , poly_PolygonDateTime, poly_IRWINID, poly_FORID
                         , poly_Acres_AutoCalc, poly_SourceOID, poly_SourceGlobalID
                         , poly_Source, attr_SourceOID, attr_ABCDMisc
                         , attr_ADSPermissionState, attr_CalculatedAcres
                         , attr_ContainmentDateTime, attr_ControlDateTime
                         , attr_CreatedBySystem, attr_IncidentSize, attr_DiscoveryAcres
                         , attr_DispatchCenterID, attr_EstimatedCostToDate, attr_FinalAcres
                         , attr_FFReportApprovedByTitle, attr_FFReportApprovedByUnit
                         , attr_FFReportApprovedDate, attr_FireBehaviorGeneral
                         , attr_FireBehaviorGeneral1, attr_FireBehaviorGeneral2
                         , attr_FireBehaviorGeneral3, attr_FireCause, attr_FireCauseGeneral
                         , attr_FireCauseSpecific, attr_FireCode, attr_FireDiscoveryDateTime
                         , attr_FireDepartmentID, attr_FireMgmtComplexity, attr_FireOutDateTime
                         , attr_FireStrategyConfinePercent, attr_FireStrategyFullSuppPrcnt
                         , attr_FireStrategyMonitorPercent, attr_FireStrategyPointZonePrcnt
                         , attr_FSJobCode, attr_FSOverrideCode, attr_GACC 
                         , attr_ICS209ReportDateTime, attr_ICS209ReportStatus
                         , attr_ICS209RptForTimePeriodFrom, attr_ICS209RptForTimePeriodTo
                         , attr_IncidentManagementOrg, attr_IncidentName
                         , attr_IncidentShortDescription, attr_IncidentTypeCategory
                         , attr_IncidentTypeKind, attr_InitialLatitude, attr_InitialLongitude
                         , attr_InitialResponseAcres, attr_InitialResponseDateTime
                         , attr_IrwinID, attr_IsFireCauseInvestigated
                         , attr_IsFireCodeRequested, attr_IsFSAssisted
                         , attr_IsMultiJurisdictional, attr_IsReimbursable, attr_IsTrespass
                         , attr_IsUnifiedCommand, attr_PercentContained
                         , attr_PercentPerimToBeContained, attr_POOCity, attr_POOCounty
                         , attr_POODispatchCenterID, attr_POOFips
                         , attr_POOJurisdictionalAgency, attr_POOJurisdictionalUnit
                         , attr_POOJurisdictUnitParentUnit, attr_POOLandownerCategory
                         , attr_POOLandownerKind, attr_POOLegalDescPrincipalMerid
                         , attr_POOLegalDescQtr, attr_POOLegalDescQtrQtr
                         , attr_POOLegalDescRange, attr_POOLegalDescSection
                         , attr_POOLegalDescTownship, attr_POOPredictiveServiceAreaID
                         , attr_POOProtectingAgency, attr_POOProtectingUnit, attr_POOState
                         , attr_PredominantFuelModel, attr_PredominantFuelGroup
                         , attr_ModifiedBySystem, attr_ModifiedOnDateTime_dt
                         , attr_PrimaryFuelModel, attr_LocalIncidentIdentifier
                         , attr_SecondaryFuelModel, attr_TotalIncidentPersonnel
                         , attr_UniqueFireIdentifier, attr_FORID, attr_WFDSSDecisionStatus
                         , attr_StratDecisionPublishDate, attr_EstimatedFinalCost
                         , attr_OrganizationalAssessment, attr_CreatedOnDateTime_dt
                         , attr_IsCpxChild, attr_CpxID, attr_CpxName, attr_SourceGlobalID
                         , attr_SourceGlobalID, attr_Source, GlobalID, SHAPE_Area.x
                         , SHAPE_Area.y, SHAPE_Length.y, SHAPE_Length.x))


