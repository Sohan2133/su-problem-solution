class Solution(object):
    def xorQueries(self, arr, queries):
        """
        :type arr: List[int]
        :type queries: List[List[int]]
        :rtype: List[int]
        """
        result = []
        for query in queries:
            a_i = query[0]
            b_i = query[1]

            if a_i == b_i :
                result.append(arr[a_i])
                continue
            ans = arr[a_i]
            for i in range (a_i+1, b_i+1):
                ans = ans ^ arr[i]
            result.append(ans)
        return result

# Input: arr = [4,8,2,10], queries = [[2,3],[1,3],[0,0],[0,3]]
# Output: [8,0,4,4]

if __name__ == '__main__':
    arr = [4, 8, 2, 10]
    queries = [[2, 3], [1, 3], [0, 0], [0, 3]]
    print(Solution().xorQueries(arr,queries))
