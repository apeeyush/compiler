class EnumProgram
{
   int [10]array = {1,2,3,4,3,3,3};
   void Merge(int left, int mid, int right)
{
    int [10]tempArray;
    int pos=0,lpos = left,rpos = mid + 1;
    while(lpos <= mid && rpos <= right)
    {
        if(array[lpos] < array[rpos])
         {
            tempArray[pos+=1] = array[lpos+=1];
         }
        else
        {
            tempArray[pos+=1] = array[rpos+=1];
         }
    }
    while(lpos <= mid){  tempArray[pos+=1] = array[lpos+=1];}
    while(rpos <= right){tempArray[pos+=1] = array[rpos+=1];}
    int i;
    for(i=0;i<pos;i+=1)
    {
      array[i+left] = tempArray[i];
    }
    return;
}
   void MergeSort(int left, int right)
   {
    int mid = (left+right)/2;
    if(left<right)
    {
        /* Sort the left part */
        MergeSort(left,mid);
        /* Sort the right part */
        MergeSort(mid+1,right);
        /* Merge the two sorted parts */
         Merge(left,mid,right);
    }
}

   void Main()
   {
      MergeSort(0,9);  
   }
}
