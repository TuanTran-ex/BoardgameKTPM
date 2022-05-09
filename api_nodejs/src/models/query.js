exports.qFindAllUser = () => {
  return `SELECT * FROM [User]`;
};
exports.qFindUser = (username, email) => {
  if (email)
    return `SELECT * FROM [User] WHERE Username='${username}' OR Email='${email}'`;
  else return `SELECT * FROM [User] WHERE Username='${username}'`;
};
exports.qFindUserById = (id) => {
  return `SELECT * FROM [User] WHERE Id='${id}'`;
};
exports.qSignIn = (username, email, password) => {
  return `INSERT INTO [User] (Username, Password, Email, [Role]) 
  VALUES ('${username}', '${password}', '${email}', 1)`;
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
