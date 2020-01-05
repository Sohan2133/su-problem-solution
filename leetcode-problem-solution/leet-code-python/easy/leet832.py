class Solution(object):
    def flipAndInvertImage(self, A):
        """
        :type A: List[List[int]]
        :rtype: List[List[int]]
        """
        for arr in A:
            last = len(arr) - 1
            first = 0
            while (first < last):
                temp = abs(arr[first] - 1)
                arr[first] = abs(arr[last] - 1)
                arr[last] = temp
                first += 1
                last -=1
        return A

if __name__ == '__main__':
    A = [
            [1,1,0,0],
            [1,0,0,1],
            [0,1,1,1],
            [1,0,1,0]
         ]
    print(Solution().flipAndInvertImage(A))