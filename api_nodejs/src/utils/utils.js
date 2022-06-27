exports.getPathImgUpload = (path) => {
  const newPath = path.replace('\\', '/');
  return newPath.replace('src/public/', 'http://localhost:3000/');
};
exports.sleep = (ms) => {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}