import collections


class Solution(object):
    def findPairs1(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        nums.sort()
        prev_i,prev_j = float('+inf'),float('-inf')
        total = 0
        for i in range(0,len(nums) - 1):
            for j in range(i+1, len(nums)):
                diff = abs(nums[j] - nums[i])
                if diff > k : break
                if prev_i == nums[i] and prev_j == nums[j] : break
                if diff == k:
                    prev_i,prev_j = nums[i],nums[j]
                    total += 1
                    break
        return total

    def findPairs(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        total = 0
        if k > 0:
            total = len(set(nums) & set(num + k for num in nums))
        elif k == 0:
            total = sum(v>1 for v in collections.Counter(nums).values())
        return total


if __name__ == '__main__':
    nums = [1, 3, 1, 1, 5, 4]
    k = 0
    print(Solution().findPairs(nums,k))