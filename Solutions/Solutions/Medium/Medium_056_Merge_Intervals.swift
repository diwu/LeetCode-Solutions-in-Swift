/*
https://leetcode.com/problems/merge-intervals/
#56 Merge Intervals
Level: medium
Given a collection of intervals, merge all overlapping intervals.
For example,
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].
 
Runtime : Min 56 ms
Memory consumed  : 14.8 MB
 */
import Foundation
/* LOGIC :   Let j be a pointing value that points at the end of the array. i is a pointing value that is lower than j and tends to zero.
      as we go from i to 0 we compare the values of arr[i] and arr[j]. if we find that we can merge them (using the logic below), we just update the value of arr[i] to be the merged value, and remove the value of arr[j]. since it is removed from the end we avoid a complete traversal from the start of the array. also the size of the array reduces with each merge, this makes it possible to solve the question without using sort, which was my initial goal.*/

struct Medium_056_Merge_Intervals {
    static func merge(_ intervals: [[Int]]) -> [[Int]] {
       var arr = intervals
        var i = intervals.count - 1
        var j = intervals.count - 1
        while(j > 0)
        {
            i = j - 1 // i always is lesser than j.
            while (i >= 0)
            {
               
                if (arr[i][0] <= arr[j][0]) && (arr[i][1] >= arr[j][0])
                {
                    if (arr[i][1] <= arr[j][1])
                     {
                        arr[i] = [arr[i][0],arr[j][1]]
                        
                     }
                    else
                     {
                        arr[i] = [arr[i][0],arr[i][1]]
                      }
                    // after any merge, we remove the interval which is close to the end of the list
                        arr.remove(at: j)
                        break
                }
                if (arr[i][0] >= arr[j][0]) && (arr[i][0] <= arr[j][1])
                {
                  if (arr[i][1] >= arr[j][1])
                    {
                        arr[i] = [arr[j][0],arr[i][1]]
                        
                  }
                    else
                    {
                        arr[i] = [arr[j][0],arr[j][1]]
                        
                    }
                    arr.remove(at: j)
                      break
                }
                
                i -= 1
            }
            j -= 1
        }
        return arr
    }
}
