
class Solution(object):
    def sortArrayByParity(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        """
        first = 0
        last = len(A) - 1
        while(first < last):
            if A[first]%2 == 0:
                first +=1

            if A[first]%2 == 1 and A[last]%2 == 0:
                temp = A[first]
                A[first] = A[last]
                A[last] = temp
                first +=1
                last -=1

            if A[last]%2 == 1:
                last -=1

        return A

if __name__ == '__main__':
    A = [3, 1, 2, 4]
    print(Solution().sortArrayByParity(A))
