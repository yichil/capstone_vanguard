
--CONSOLIDATED HOLDINGS FOR THE ALL INSTRUMENTS OWNED BY GIVEN FUND

SELECT 
		OM.INSTRID, RR.COMNAME, RR.INSTRTYPE, OM.LGCYINVESTORID, IR.FULLNAME
		,P.HOLDDATE, P.OWNERSHIPID, P.FILINGTYPECODE, A3.DESC_, P.PCTSHOUTHLD , P.SHSHLD, P.ShsHldChg, P.ShsHldValChg, P.SHSHLDVAL 
FROM OWN2OWNERMAP OM
LEFT   JOIN  RDCINSTRINFO RR
		ON RR.GEMPERMID=OM.INSTRID     --OWN2 MAPPING
LEFT JOIN OWN2INVRESUME IR
		ON OM.LGCYINVESTORID = IR.LGCYINVESTORID
LEFT JOIN OWN2CHOLDDET P         -- RETUNS THE CONSOLIDATED HOLDINGS
		ON P.OWNERSHIPID=OM.OWNERSHIPID
LEFT  JOIN OWN2CODE A3
		ON P.FILINGTYPECODE=A3.CODE
		AND A3.TYPE_='3'             --FILING SOURCE    
WHERE  OM.LGCYINVESTORID='2004260' -- VANGUARD 
		AND P.HOLDDATE <='2017-06-30'      --GIVEN MONTH END
		AND P.EFFECTTODATE>='2017-06-30'
		--AND OM.INSTRID = 8590923821 --Noble Group Ord Shs
		AND P.PCTSHOUTHLD IS NOT NULL 
		AND P.PCTSHOUTHLD<>0 
		AND P.FILINGTYPECODE = 1