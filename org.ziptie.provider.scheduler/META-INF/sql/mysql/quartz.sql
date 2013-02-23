#
# In your Quartz properties file, you'll need to set 
# org.quartz.jobStore.driverDelegateClass = org.quartz.impl.jdbcjobstore.StdJDBCDelegate
#
#
# By: Ron Cordell - roncordell
#  I didn't see this anywhere, so I thought I'd post it here. This is the script from Quartz to create the tables in a MySQL database, modified to use INNODB instead of MYISAM.

DROP TABLE IF EXISTS execution_history CASCADE;

CREATE TABLE execution_history (
    id INTEGER NOT NULL,
    trigger_name VARCHAR(80) NOT NULL,
    trigger_group VARCHAR(80) NOT NULL,
    job_name VARCHAR(80) NOT NULL,
    job_group VARCHAR(80) NOT NULL,
    job_type VARCHAR(80) NOT NULL,
    job_class VARCHAR(128) NOT NULL,
    executor VARCHAR(60),
    canceled BIT NOT NULL DEFAULT 0,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE INDEX exec_hist_start_ndx ON execution_history (start_time);
CREATE INDEX exec_hist_end_ndx ON execution_history (end_time);
CREATE INDEX exec_hist_trigger_ndx ON execution_history (trigger_name, trigger_group);
CREATE INDEX exec_hist_job_ndx ON execution_history (job_name, job_group);

DROP TABLE IF EXISTS QRTZ_JOB_LISTENERS;
DROP TABLE IF EXISTS QRTZ_TRIGGER_LISTENERS;
DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;

CREATE TABLE QRTZ_JOB_DETAILS(
JOB_NAME VARCHAR(80) NOT NULL,
JOB_GROUP VARCHAR(80) NOT NULL,
DESCRIPTION VARCHAR(120) NULL,
JOB_CLASS_NAME VARCHAR(128) NOT NULL,
IS_DURABLE VARCHAR(1) NOT NULL,
IS_VOLATILE VARCHAR(1) NOT NULL,
IS_STATEFUL VARCHAR(1) NOT NULL,
REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_JOB_LISTENERS (
JOB_NAME VARCHAR(80) NOT NULL,
JOB_GROUP VARCHAR(80) NOT NULL,
JOB_LISTENER VARCHAR(80) NOT NULL,
PRIMARY KEY (JOB_NAME,JOB_GROUP,JOB_LISTENER),
INDEX (JOB_NAME, JOB_GROUP),
FOREIGN KEY (JOB_NAME,JOB_GROUP)
REFERENCES QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_TRIGGERS (
TRIGGER_NAME VARCHAR(80) NOT NULL,
TRIGGER_GROUP VARCHAR(80) NOT NULL,
JOB_NAME VARCHAR(80) NOT NULL,
JOB_GROUP VARCHAR(80) NOT NULL,
IS_VOLATILE VARCHAR(1) NOT NULL,
DESCRIPTION VARCHAR(120) NULL,
NEXT_FIRE_TIME BIGINT(13) NULL,
PREV_FIRE_TIME BIGINT(13) NULL,
PRIORITY INTEGER NULL,
TRIGGER_STATE VARCHAR(16) NOT NULL,
TRIGGER_TYPE VARCHAR(8) NOT NULL,
START_TIME BIGINT(13) NOT NULL,
END_TIME BIGINT(13) NULL,
CALENDAR_NAME VARCHAR(80) NULL,
MISFIRE_INSTR SMALLINT(2) NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (JOB_NAME, JOB_GROUP),
FOREIGN KEY (JOB_NAME,JOB_GROUP)
REFERENCES QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
TRIGGER_NAME VARCHAR(80) NOT NULL,
TRIGGER_GROUP VARCHAR(80) NOT NULL,
REPEAT_COUNT BIGINT(7) NOT NULL,
REPEAT_INTERVAL BIGINT(12) NOT NULL,
TIMES_TRIGGERED BIGINT(7) NOT NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_CRON_TRIGGERS (
TRIGGER_NAME VARCHAR(80) NOT NULL,
TRIGGER_GROUP VARCHAR(80) NOT NULL,
CRON_EXPRESSION VARCHAR(120) NOT NULL,
TIME_ZONE_ID VARCHAR(80),
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
TRIGGER_NAME VARCHAR(80) NOT NULL,
TRIGGER_GROUP VARCHAR(80) NOT NULL,
BLOB_DATA BLOB NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_TRIGGER_LISTENERS (
TRIGGER_NAME VARCHAR(80) NOT NULL,
TRIGGER_GROUP VARCHAR(80) NOT NULL,
TRIGGER_LISTENER VARCHAR(80) NOT NULL,
PRIMARY KEY (TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_LISTENER),
INDEX (TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_CALENDARS (
CALENDAR_NAME VARCHAR(80) NOT NULL,
CALENDAR BLOB NOT NULL,
PRIMARY KEY (CALENDAR_NAME))
ENGINE=InnoDB;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
TRIGGER_GROUP VARCHAR(80) NOT NULL,
PRIMARY KEY (TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
ENTRY_ID VARCHAR(95) NOT NULL,
TRIGGER_NAME VARCHAR(80) NOT NULL,
TRIGGER_GROUP VARCHAR(80) NOT NULL,
IS_VOLATILE VARCHAR(1) NOT NULL,
INSTANCE_NAME VARCHAR(80) NOT NULL,
FIRED_TIME BIGINT(13) NOT NULL,
PRIORITY INTEGER NOT NULL,
STATE VARCHAR(16) NOT NULL,
JOB_NAME VARCHAR(80) NULL,
JOB_GROUP VARCHAR(80) NULL,
IS_STATEFUL VARCHAR(1) NULL,
REQUESTS_RECOVERY VARCHAR(1) NULL,
PRIMARY KEY (ENTRY_ID))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SCHEDULER_STATE (
INSTANCE_NAME VARCHAR(80) NOT NULL,
LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
CHECKIN_INTERVAL BIGINT(13) NOT NULL,
PRIMARY KEY (INSTANCE_NAME))
ENGINE=InnoDB;

CREATE TABLE QRTZ_LOCKS (
LOCK_NAME VARCHAR(40) NOT NULL,
PRIMARY KEY (LOCK_NAME))
ENGINE=InnoDB;

INSERT INTO QRTZ_LOCKS values('TRIGGER_ACCESS');
INSERT INTO QRTZ_LOCKS values('JOB_ACCESS');
INSERT INTO QRTZ_LOCKS values('CALENDAR_ACCESS');
INSERT INTO QRTZ_LOCKS values('STATE_ACCESS');
INSERT INTO QRTZ_LOCKS values('MISFIRE_ACCESS');
commit; 
