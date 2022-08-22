void main()
{
      // Format Exception

      String a ="Hello";
      int x=0;
      int y =10;

      try {
            // int c = y~/x;
            // print(c);
            int z = int.parse(a);
            print(z);
      }catch(e)
      {
            print("Enter valid Value ");
      }

      finally{
            print("Thank you");
      }

}