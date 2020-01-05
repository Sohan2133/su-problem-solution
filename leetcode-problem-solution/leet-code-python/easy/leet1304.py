
def sumZero(n):
    """
    :type n: int
    :rtype: List[int]
    """
    ans = []
    if n%2 == 1:
        ans.append(0)
    for i in range(1,int(n/2) + 1):
        ans.append(i)
        ans.append(-i)

    return ans


if __name__ == '__main__':
    print(sumZero(6))

