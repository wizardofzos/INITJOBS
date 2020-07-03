//IBMUSERA JOB ACCT#,                                                   JOB00040
//             IBMUSER,       **JOB STATEMENT GENERATED BY SUBMIT**
//             NOTIFY=&SYSUID,
//             MSGLEVEL=(1,1)
//*
//*   SYMBOLS
//*
//AUTOMNT EXEC PGM=BPXBATCH
//SYSPRINT  DD SYSOUT=*
//STDOUT    DD SYSOUT=*
//STDDERR   DD SYSOUT=*
//STDPARM   DD *
SH echo "/home               /etc/home.map" > /etc/auto.master;
   echo "name                *" > /etc/home.map;
   echo "type                ZFS" >> /etc/home.map;
   echo "filesystem          <uc_name>.HOME.ZFS" >> /etc/home.map;
   echo "mode                rdwr" >> /etc/home.map;
   echo "duration            120" >> /etc/home.map;
   echo "delay               10 " >> /etc/home.map;
   echo "/usr/sbin/automount" >> /etc/rc;
   echo "echo automount started" >> /etc/rc;
   echo "sleep 3            " >> /etc/rc;
   mkdir /home;
   chown IBMUSER:SYS1 /home;
   chmod 755 /home;
   /usr/sbin/automount