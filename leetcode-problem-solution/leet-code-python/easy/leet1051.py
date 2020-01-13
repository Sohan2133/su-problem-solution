class Solution(object):
    def heightChecker(self, heights):
        """
		:type heights: List[int]
		:rtype: int
		"""
        sorted_heights = []
        for height in heights:
            sorted_heights.append(height)
        sorted_heights.sort()

        total_mismatch = 0
        for i in range(0, len(heights)):
            if sorted_heights[i] != heights[i]:
                total_mismatch += 1
        return total_mismatch


if __name__ == '__main__':
    a = [1, 1, 4, 2, 1, 3]
    print(Solution().heightChecker(a))
