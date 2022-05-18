exports.getPathImgUpload = (path) => {
  const newPath = path.replaceAll('\\', '/');
  return newPath.replace('public/', 'http://localhost:3000/');
};
