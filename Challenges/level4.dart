class Distance {
  final double kms;
  final double meters;
  final double cms;

  // Named uctors
  Distance.kms(this.kms): 
    meters = kms * 1000, 
    cms = kms * 100000;
  Distance.meters(this.meters): 
    kms = meters / 1000, 
    cms = meters * 100;

  // Operator Overloading
  Distance operator +(Distance other) {
    // We can also use the unit cms or kms
    return Distance.meters(meters + other.meters); 
  }
}

void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);
  
  print(d1.meters);       
  print(d2.kms);   
  print((d1 + d2).kms); 
  print((d1 + d2).meters);
  print((d1 + d2).cms);

}