# 2024 Notice
- HW1 체커를 추가했습니다.
- HW2 체커를 추가했습니다.
- HW3 체커를 추가했습니다만, 테스트 케이스들이 아직 추가되지 않았습니다. 자체적으로 제작한 테스트 케이스들을 몇 개 추가할 예정이긴 하지만, 여러분이 테스트 케이스를 직접 추가해서 PR을 날려 주시면 더 좋을 것 같습니다.
- HW3 테스트 케이스를 몇 개 추가했습니다. 추가적인 테스트 케이스는 언제나 환영합니다.
- HW4 체커를 추가했습니다. 1~3번은 hw4-A, 4번은 hw4-B에 들어가 있습니다.
- HW6-A 체커를 추가했습니다. 1~2번이 들어가 있습니다.
- HW6-B 체커를 추가했습니다. 3번이 들어가 있습니다.
- HW7 체커를 추가했습니다.

# pl-checker
2024년 봄학기 Programming Language 숙제 자동 채점기 <br>
[Jhuni의 채점기](https://github.com/Jhuni0123/pl-checker) 에 기반해서 만들어진 채점기입니다.<br>

채점의 **자동화**를 목표로 하고있습니다. 최대한 많은 경우를 테스트 하게 하려고 노력하고 있지만 커버되지 않는 케이스가 있을 수 있습니다. 즉 여기 있는 테스트 케이스를 **모두 통과해도 만점을 받는것을 보장하지 못합니다.** <br>
좋은 테스트케이스가 있다면 [이슈보드](https://github.com/coffeetea99/pl-checker/issues)에 올려주신다면 최대한 빠르게 추가하겠습니다.

# How to use
unix 기반 환경을 필요로 합니다
```bash
git clone https://github.com/coffeetea99/pl-checker
cd pl-checker
cd ./2024/hw<num>
# please read README.md
./check
```

# How to update
**테스트케이스가 종종 업데이트 됩니다. 주기적으로 업데이트 해주세요!** <br>
업데이트 해도 작성한 파일이 덮어씌워지지 않습니다.

```bash
git pull --rebase origin master
```

# Thanks to
- [Jhuni](https://github.com/Jhuni0123)
- [kipa00](https://github.com/kipa00)
- [kjp4155](https://github.com/kjp4155)
- [Leeingnyo](https://github.com/Leeingnyo)
- [sanggggg](https://github.com/sanggggg)
- All students sharing testcases
- All TAs in PL lecture

# 2018 Notice 
- HW5 체커를 업데이트했습니다. 작년과 문제가 동일합니다.
- HW4 체커를 업데이트했습니다. 작년과 문제가 동일하고 순서만 바뀌어 Jhuni의 체커를 그대로 사용합니다.  
- HW3-2, HW3-3 데이터를 추가했습니다. HW3-2에서 10000보다 큰 입력은 시간이 많이 걸리는데 어떻게 할지 생각중입니다. 일단은 테스트케이스 파일만 만들어 두고, ./check 스크립트에는 포함시키지 않았으니 필요하다면 따로 돌려주세요.
- HW3-3 체커에 버그가 있어서 수정했습니다. 꼭 pull 해 주세요.
- HW3 체커를 업데이트했습니다. 작년과 문제가 같아서 Jhuni의 체커를 그대로 사용합니다.  
- HW2 테스트를 많이 보충했습니다. pull 해 주세요.
- HW2 체커가 완성되었습니다! 아직은 데이터가 약합니다. 제출기한 전까지 수시로 보충할 예정입니다.
- HW1 테스트 업데이트가 완료되었습니다. (TA 예제 포함)
- 2017, 2018과제를 구분하도록 디렉토리 구조를 수정했습니다.
- "./check 2" 와 같이 과제 번호를 지정해 주어야 어떤 테스트 케이스에서 틀렸는지 확인이 가능합니다.

# 2019 Notice

- HW4 K- 추가
- HW1-7 추가
- HW2 추가 완료 (2018년 복사)
- HW1 추가 완료 (지난 년도 과제들 복사)

---
[MIT License](LICENSE)
