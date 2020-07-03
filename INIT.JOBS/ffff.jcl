//IBMUSERA JOB ACCT#,                                                   JOB00040
//             IBMUSER,       **JOB STATEMENT GENERATED BY SUBMIT**
//             NOTIFY=&SYSUID,
//             MSGLEVEL=(1,1)
//CZFS    EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *,SYMBOLS=JCLONLY
  DEFINE CLUSTER(NAME(ZDO.ROCKET.ZFS))   -
  LINEAR CYLINDERS(50 15) SHAREOPTIONS(2))
//FZFS    EXEC PGM=IOEAGFMT,REGION=0M,
//             PARM=('-aggregate ZDO.ROCKET.ZFS -compat')
//SYSPRINT  DD SYSOUT=*
//STDOUT    DD SYSOUT=*
//STDERR    DD SYSOUT=*
//SETPERM EXEC PGM=BPXBATCH
//SYSPRINT  DD SYSOUT=*
//STDOUT    DD SYSOUT=*
//STDDERR   DD SYSOUT=*
//STDPARM   DD *,SYMBOLS=JCLONLY
SH mkdir -p /zdo/rocket;
chown IBMUSER /zdo/rocket;
chmod 755 -R /zdo/rocket;
