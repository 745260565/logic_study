//
//  main.m
//  比较版本号
//
//  Created by ws on 2022/3/9.
//

#import <Foundation/Foundation.h>

int compareVersion(char *version1, char *version2) {
    // '\0'
    int m = strlen(version1);
    int n = strlen(version2);
    
    int i = 0;
    int j = 0;
    
    while (i < m || j < n) {
        int x = 0;
        for (; i < m && version1[i] != '.'; i++) {
            // '2' '1'
            // 1. 字符 -》  '1' -〉1
            // ascii '0' < '1'
            // 2. '2' '1' -> 21
            // 2  ?
            // 循环几次代表有多少位数字 -》2 * 几个10
            x = x * 10 + version1[i] - '0';
            // 2 * 10 + 1 = 21
        }
        // version1[i] = .
        i++;
        int y = 0;

        for (; j < n && version2[j] != '.'; j++) {
            y = y * 10 + version2[j] - '0';
        }
        // version1[i] = .
        j++;
        
        if (x != y) {
            return x > y ? 1 : -1;
        }
    }
    return 0;
}


int main(int argc, const char * argv[]) {
    int m = compareVersion("21.001", "21.03");
    return 0;
}
