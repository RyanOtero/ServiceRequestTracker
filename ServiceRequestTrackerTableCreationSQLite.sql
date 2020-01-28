CREATE TABLE [Employees] (
  [EmployeeID] INTEGER NOT NULL
, [FirstName] TEXT NOT NULL
, [LastName] TEXT NOT NULL
, [Department] TEXT CHECK (Department IN ('Manufacturing','Sales','IT','Engineering')) NOT NULL
, CONSTRAINT [PK_Employees] PRIMARY KEY ([EmployeeID])
);

CREATE TABLE [ServiceRequests] (
  [RequestID] INTEGER NOT NULL
, [DateRequested] TEXT NOT NULL
, [Description] TEXT NOT NULL
, [RequestingEmployeeID] INTEGER NOT NULL
, [AssignedTechID] INTEGER
, [Status] TEXT NOT NULL CHECK ([Status] IN ('Created','Assigned','Complete'))
, [DateComplete] TEXT 
, [Notes] TEXT
, CONSTRAINT [PK_ServiceRequests] PRIMARY KEY ([RequestID])
);
