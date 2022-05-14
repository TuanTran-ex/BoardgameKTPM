const logger = require('../utils/logger');

// User
exports.qFindAllUser = (page, pageSize) => {
  if (page && pageSize) {
    return `EXECUTE proc_User_Getall ${page}, ${pageSize}`;
  } else
    return `SELECT Id, FullName, Email, DOB, Gender, Phone, Avatar, CreatedAt
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

exports.qChangePass = (id, newPass) => {
  return `EXECUTE proc_User_ChangePass ${id}, '${newPass}'`;
};

// Address
exports.qFindListAddrByUserId = (userId) => {
  return `SELECT * FROM UserAddress WHERE UserId = ${userId}`;
};

// Cart
// exports.qGetCartByUserId = (userId) => {
//   return `EXECUTE proc_Cart_Get ${userId}`;
// };

exports.qGetCartByUserId = (userId) => {
  return `SELECT cp.Id , p.Id AS 'ProductId' , p.Name, cp.Amount , pp.Price, p.MainImage , isnull(slcl.SoConLai, p.Amount) AS 'RemainingAmount' 
	FROM 	Cart AS c 
	LEFT 	JOIN CartProduct AS cp ON c.Id = cp.CartId 
			JOIN Product AS p ON cp.ProductId  = p.Id 
			JOIN ProductPrice pp ON pp.ProductId = p.Id 
			LEFT JOIN (
				SELECT Product.Id , (Product.Amount - SUM(OrderDetail.Quantity)) AS SoConLai
				FROM Product 
				JOIN OrderDetail ON Product .Id = OrderDetail.ProductId 
				GROUP BY Product.Id , Product.Amount 
			) AS slcl ON slcl.Id = p.Id  
	WHERE	c.UserId = ${userId}
	GROUP BY cp.Id ,p.Id, p.Name, cp.Amount , pp.Price, pp.CreatedAt, p.MainImage , slcl.SoConLai, p.Amount 
	HAVING pp.CreatedAt >= (
				SELECT 	TOP(1) CreatedAt
				FROM 	ProductPrice 
				WHERE	p.Id  = ProductPrice.ProductId 
				ORDER BY CreatedAt DESC
				)`;
};
exports.qGetCartId = (userId) => {
  return `SELECT Id FROM Cart WHERE UserId = ${userId}`;
};
exports.qGetCartById = (id) => {
  return `SELECT * FROM Cart WHERE Id = ${id}`;
};
exports.qAddCartItem = (cartId, productId, amount) => {
  return `EXECUTE proc_Cart_AddItem ${cartId}, ${productId}, ${amount}`;
};
exports.qUpdateCartItem = (id, amount) => {
  return `EXECUTE proc_Cart_UpdateItem ${id}, ${amount}`;
};
exports.qGetCartProductById = (id) => {
  return `SELECT * FROM CartProduct WHERE Id = ${id}`;
};
exports.qDeleteCartProductById = (id) => {
  return `DELETE FROM CartProduct WHERE Id= ${id}`;
};
// Auth
exports.qSignUp = (username, email, password) => {
  return `INSERT INTO [User] (Username, Password, Email, [Role]) 
  VALUES ('${username}', '${password}', '${email}', 0)`;
};

// Voucher
exports.qGetAllVoucher = (page, pageSize, status) => {
  if (page && pageSize) {
    return `EXECUTE proc_Voucher_Getall ${page}, ${pageSize}, ${
      status || 'NULL'
    }`;
  } else {
    return `SELECT * FROM Voucher WHERE IsDelete = 0`;
  }
};

exports.qFindVoucherById = (id) => {
  if (/^\d+$/.test(id)) return `SELECT * FROM Voucher WHERE Id = ${id}`;
  else return `SELECT * FROM Voucher WHERE Code = '${id}'`;
};

exports.qFindVoucherByCode = (code) => {
  return `SELECT * FROM Voucher WHERE Code = '${code}'`;
};

exports.qAddVoucher = (code, expired, amount, value, createBy) => {
  // return `EXECUTE proc_Voucher_Add '${code}', '${expired}', ${amount}, ${value}, ${createBy}`;
  return `INSERT INTO Voucher(Code, Expired, Amount, Value, CreatedBy, UpdatedBy)
  OUTPUT Inserted.ID
  Values ('${code}', '${expired}', ${amount}, ${value}, ${createBy}, ${createBy})`;
};

exports.qUpdateVoucher = (
  id,
  status,
  value,
  amount,
  expired,
  type,
  updateBy
) => {
  return `EXECUTE proc_Voucher_Update ${id}, ${status || 'NULL'}, ${
    value || 'NULL'
  }, ${amount || 'NULL'}, ${expired || 'NULL'}, ${type || 'NULL'}, ${updateBy}`;
};

exports.qDeleteVoucher = (id) => {
  return `EXECUTE proc_Voucher_Delete ${id}`;
};
