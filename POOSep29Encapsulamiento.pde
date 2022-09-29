class Cuenta{
  String nombreCliente;
  int dia;
  int mes;
  int anio;
  String rfc;
  int numeroDeCuenta;
  float saldo;
  
  Cuenta(String n_, int d_, int m_, int a_, String rfc_, float s_){
    nombreCliente = n_;
    dia = d_;
    mes = m_;
    anio = a_; 
    rfc = rfc_;
    numeroDeCuenta = round(random(100));
    saldo= s_;
  }
  
  float retiro(float cantidad_){
    float r = 0;
    if(saldo>cantidad_){
      r = cantidad_;
      saldo-=cantidad_;
    }    
    return r;
  }
  
  void deposito(float cantidad_){
    saldo += cantidad_;
  }
  
  float retiroExterno(float cantidad_){
    float comision = 5;
    float r = 0;
    if(saldo>cantidad_+comision){
      r = cantidad_;
      saldo-=cantidad_+comision;
    }    
    return r;
  }
  
  float saldo(){
    return saldo;
  }
  
  float saldoExterno(){
    float comision = 5;
    saldo-= comision;
    return saldo;
  }
}

Cuenta una;

void setup(){
  una = new Cuenta("Benjamín",19,12,80,"MOOB801219",2000);
}

void draw(){
}

void keyPressed(){
  switch(key){
    case '1':
      println("tu saldo es de: " + una.saldo());
    break;
    case '2':
      una.deposito(100);
      println("incrementase tu saldo en 100");
    break;
    case '3':
      println("retiraste " + una.retiro(100));
    break;
    case '4':
       println("retiraste " + una.retiroExterno(100));
    break;
    case '5':
      println("tu saldo es de: " + una.saldoExterno());
    break;
  }
}
