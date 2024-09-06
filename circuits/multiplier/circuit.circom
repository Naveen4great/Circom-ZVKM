pragma circom 2.0.0;

/*GATE CIRCUIT*/  

template Multiplier2 () {  

   // input signal of circuit
      signal input a;
      signal input b;


  //intermediate signal of circuit
      signal x;
      signal y;


// output signal of circuit
      signal output q;
// gates used
      component andGate = AND();
      component notGate = NOT();
      component orGate = OR();


//input giving

      andGate.a <== a;
      andGate.b <== b;
      notGate.in <== b;
//Intermediate Signal Input giving

      x <== andGate.out;
      y <== notGate.out;
  //Input for OR Gate giving

      orGate.a <== x;
      orGate.b <== y;
//output getting from OR gate

      q <== orGate.out;

   
}
//Templates of the gate used in circuit

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}
template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
