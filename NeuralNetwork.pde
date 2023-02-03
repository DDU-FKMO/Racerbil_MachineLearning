class NeuralNetwork {
  int[] Weights, Bias;
  NeuralNetwork(String DNA) {
    Weights = new int[8];
    Bias = new int[3];
    char[] chars = DNA.toCharArray();
    for(int c = 0; c < chars.length; c++) {
      int v = int(chars[c]);
      if(v >= 5) v = 10 - v;
      if(c < 8) {
        Weights[c] = v;
      } else {
        Bias[c - 8] = v;
      }
    }
  }
  
  float GetOutput(boolean left, boolean right, boolean front) {
    //Level 0
    float n01 = left ? 1 : 0;
    float n02 = front ? 1 : 0;
    float n03 = right ? 1 : 0;
    //Level 1
    float n11 = (n01*Weights[0])+(n02*Weights[2])+(n03*Weights[4])+Bias[0];
    float n12 = (n01*Weights[1])+(n02*Weights[3])+(n03*Weights[5])+Bias[1];
    //Level 2
    float n21 = (n11*Weights[6])+(n12*Weights[7])+Bias[2];
    
    return n21;
  }
}
