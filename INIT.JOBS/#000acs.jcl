# ACS ROUTINES

D SMS TO FIGURE OUT WHERE SCDS IS
SCDS = SYS1.S0W1.DFSMS.SCDS

ISMF, OPTION 7 (MAKE SURE TO BE STORADM VIA 0,0)
OPTION 5 TO FIND OUT LOCATION OF ACS ROUTINES.

SYS1.S0W1.DFSMS.CNTL(STORCLASS): ADD

FILTLIST ZDO_HLQ          INCLUDE(ZDO.**,
                                  ZDO%%.**,
                                  OAS.**,
                                  ZIGI.**,
                                  USERCAT.*)


  WHEN (&DSN = &ZDO_HLQ)
    DO
      SET &STORCLAS = 'ZDOCLS1'
      EXIT CODE(0)
    END

SYS1.S0W1.DFSMS.CNTL(STORGRP): ADD

  WHEN (&STORCLAS= 'ZDOCLS1')                                           00114532
    DO                                                                  00114632
      SET &STORGRP = 'ZDOGRP1'                                          00114732
      EXIT CODE(0)                                                      00114832
    END                                                                 00114932

CREATE STORAGE CLASS, CREATE STORAGE GROUP
RUN #001DASD THEN ADD THE VOLUMES TO THE STORAGE GROUP

TRANSLATE THE ACS ROUTINES, VERIFY THEN ACTIVATE THE SCDS
