//IBMUSERA JOB ACCT#,                                                   JOB00040
//             IBMUSER,       **JOB STATEMENT GENERATED BY SUBMIT**
//             NOTIFY=&SYSUID,
//             MSGLEVEL=(1,1)
//*
//RACF    EXEC PGM=IKJEFT01
//*            ADD THE HLQ IN RACF
//SYSTSPRT  DD SYSOUT=*
//SYSTSIN   DD *
  ADDGROUP ZDO01 -
  DATA('Primary zdevops user group') -
  OWNER(IBMUSER) -
  SUPGROUP(SYS1) -
  OMVS(AUTOGID)
