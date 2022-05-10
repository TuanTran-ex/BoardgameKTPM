exports.qFindAllUser = (page, pageSize) => {
  if (page && pageSize) {
    return `EXECUTE proc_User_Getall ${page}, ${pageSize}`;
  } else
    return `SELECT Id, FullName, Email, Address, DOB, Gender, Phone, Avatar, CreatedAt
    ,CreatedBy, UpdatedAt, UpdatedBy, Role, IsLock FROM [User]`;
};
exports.qFindUser = (username, email) => {
  if (email)
    return `SELECT * FROM [User] WHERE Username='${username}' OR Email='${email}'`;
  else return `SELECT * FROM [User] WHERE Username='${username}'`;
};
exports.qFindUserById = (id) => {
  return `SELECT * FROM [User] WHERE Id='${id}'`;
};
exports.qFindUserByUsername = (username) => {
  return `SELECT * FROM [User] WHERE Username='${username}'`;
};
exports.qLockUser = (id) => {
  return `EXECUTE proc_User_Lock ${id}`;
};
exports.qUpdateUser = (
  id,
  fullName,
  phone,
  dob,
  gender,
  email,
  avatar,
  address
) => {
  return `EXECUTE proc_User_Update ${id}, N'${fullName || 'NULL'}, '${
    phone || 'NULL'
  }, '${dob || 'NULL'}', '${gender || 'NULL'}', '${email || 'NULL'}', '${
    avatar || 'NULL'
  }', '${address || 'NULL'}'`;
};

// Address
exports.qFindListAddrByUserId = (userId) => {
  return `SELECT * FROM UserAddress WHERE UserId = ${userId}`;
};

// Auth
exports.qSignIn = (username, email, password) => {
  return `INSERT INTO [User] (Username, Password, Email, [Role]) 
  VALUES ('${username}', '${password}', '${email}', 0)`;
};
