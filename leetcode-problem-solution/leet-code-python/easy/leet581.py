class Solution(object):
    def findUnsortedSubarray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        sorted_nums = [num for num in nums ]
        sorted_nums.sort()
        first = 0
        last = len(sorted_nums) - 1
        while first<last and (nums[first] == sorted_nums[first] or nums[last] == sorted_nums[last]):
            if nums[first] == sorted_nums[first]:
                first += 1
            if nums[last] == sorted_nums[last]:
                last -= 1
        if last == first:
            return 0
        else:
            return last - first + 1

if __name__ == '__main__':
    A = [2, 6, 4, 8, 10, 9, 15]
    print(Solution().findUnsortedSubarray(A))