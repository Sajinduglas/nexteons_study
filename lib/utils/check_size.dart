bool fnCheckMobile(double width){
  return (width<650);
}
bool fnCheckTab(double size){
  return (size > 650 && size < 1024);
}
bool fnCheckDesktop(double width){
  return (width> 1024);
}