float[] values;
int i, j = 0;

void setup() {
  size(1800, 800);
  values = new float[width];
  for (int i=0; i < values.length; i++) {
    // values[i] = random(height);
    values[i] = noise(i/142.234)*height;
  }
}

void draw() {
  background(0);
  line(255, 255, 255);
  // line(random(255), random(255), random(255)); Epilepsy
  
  if (i < values.length) {
    for (int j=0; j < values.length-i-1; j++) {
      float a = values[j];
      float b = values[j+1];
      if (a > b) {
        swap(values, j, j+1);
      } 
    }
  } else {
    line(255, 1, 1);
    println("finished");
    noLoop();
  }
  i++;
}

void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

void line(float r, float g, float b) {
  for (int i=0; i < values.length; i++) {
    stroke(color(r, g, b));
    line(i, height, i, height - values[i]);
  }
}
