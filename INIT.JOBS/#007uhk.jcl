//IBMUSERA JOB ACCT#,                                                   JOB00040
//             IBMUSER,       **JOB STATEMENT GENERATED BY SUBMIT**
//             NOTIFY=&SYSUID,
//             MSGLEVEL=(1,1)
//*
//RACF    EXEC PGM=IKJEFT01
//*            ADD THE HLQ IN RACF
//SYSTSPRT  DD SYSOUT=*
//SYSTSIN   DD *
  ADDUSER ZDOHK -
      DFLTGRP(ZDO01) -
      OWNER(IBMUSER) -
      NAME('Henri Kuiper') -
      PASSWORD(HETWERKT) -
      TSO(ACCTNUM(ACCT#) PROC(ISPFPROC)) -
      OMVS( AUTOUID -
            HOME('/home/zdohk') -
            PROGRAM('/bin/sh'))

  ADDSD 'ZDOHK.**' UACC(NONE)
  PERMIT 'ZDOHK.**' ACCESS(ALTER) ID(ZDOHK)
  ADDSD 'ZDOHK.**.ZFS' UACC(READ)

  SETROPTS GENERIC(DATASET) REFRESH
//*
//ALIAS   EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *
  DEFINE ALIAS(NAME(ZDOHK) RELATE(USERCAT.ZDO))
//CZFS    EXEC PGM=IDCAMS
//SYSPRINT  DD SYSOUT=*
//SYSIN     DD *
  DEFINE CLUSTER(NAME(ZDOHK.HOME.ZFS) -
  LINEAR CYLINDERS(10 5) SHAREOPTIONS(2))
//FZFS    EXEC PGM=IOEAGFMT,REGION=0M,
//             PARM=('-aggregate ZDOHK.HOME.ZFS -compat')
//SYSPRINT  DD SYSOUT=*
//STDOUT    DD SYSOUT=*
//STDERR    DD SYSOUT=*
//SETPERM EXEC PGM=BPXBATCH
//SYSPRINT  DD SYSOUT=*
//STDOUT    DD SYSOUT=*
//STDDERR   DD SYSOUT=*
//STDPARM   DD *
SH mkdir -p /home/zdohk;
chown ZDOHK:ZDO01 /home/zdohk;
chmod 700 /home/zdohk;
