exports.getPathImgUpload = (path) => {
  console.log(typeof path);
  const newPath = path.replace('\\', '/');
  return newPath.replace('public/', 'http://localhost:3000/');
};
