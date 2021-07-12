public class Stack {
   private int maxSize;
   private long[] stackArray;
   private int top;
   
   public Stack(int s) {
      maxSize = s;
      stackArray = new long[maxSize];
      top = -1;
   }
   public void push(long j) {
      stackArray[++top] = j;
   }
   public long pop() {
      return stackArray[top--];
   }
   public long peek() {
      return stackArray[top];
   }
   public boolean isEmpty() {
      return (top == -1);
   }
   public boolean isFull() {
      return (top == maxSize - 1);
   }
   public static void main(String[] args) {
      Stack Stack = new Stack(10); 
      Stack.push(10);
      Stack.push(20);
      Stack.push(30);
      Stack.push(40);
      Stack.pop();
      Stack.pop();
      Stack.push(50);
      
      while (!Stack.isEmpty()) {
         long value = Stack.pop();
         System.out.print(value);
         System.out.print(" ");
      }
      System.out.println("");
   }
}
