class Solution(object):
    def sortedSquares(self, A):
        """
        :type A: List[int]
        :rtype: List[int]
        """
        ans = []
        pos_index = 0

        while pos_index < len(A):
            if A[pos_index] >= 0:
                break
            pos_index += 1

        negative_index = pos_index - 1
        counter = 0
        while negative_index >= 0 and pos_index < len(A):

            if abs(A[negative_index]) >= abs(A[pos_index]) :
                ans.append(A[pos_index]**2)
                pos_index += 1
            else:
                ans.append(A[negative_index]**2)
                negative_index -= 1
            counter += 1

        if negative_index >= 0:
            while negative_index >= 0:
                ans.append(A[negative_index]**2)
                counter += 1
                negative_index -= 1
        else:
            while pos_index < len(A):
                ans.append(A[pos_index]**2)
                pos_index += 1
        return ans

if __name__ == '__main__':
    A = [-4, -1, 0, 3, 10]
    print(Solution().sortedSquares(A))
