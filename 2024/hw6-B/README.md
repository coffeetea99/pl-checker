# HW6: Normal-order reduction evaluator
## How to use
1. 구현한 `evaluator.ml`을 복사하거나 뼈대코드 `evaluator.ml.orig`을 `evaluator.ml`로 바꾼 후 구현합니다.
3. `./check` 명령어를 통해 테스트케이스를 실행합니다.

- `examples/testgc<num>.l` : 테스트케이스
- `examples/testgc<num>.ans` : 정답
- `examples/testgc<num>.out` : 출력

---

>SNU 4190.310 Programming Languages

# Lambda Ground

## 컴파일 및 실행 방법

정의된 `run` 링크를 사용하여

```sh
λ ./run examples/test1.l
```

을 실행하면 입력파일을 파싱한 결과와 normal-order reduction을 적용한 결과를 같이 보여줍니다.
테스트용 프로그램을 만드실 때는 괄호를 잘 이용하시기 바랍니다.

실행시 파일명을 명시하지 않을 경우, 표준 입력으로부터 실행할 코드를 읽어들입니다.
표준 입력으로 프로그램을 입력하신 후, 첫 번째 칸(column)에서 Ctrl-D를 누르면 프로그램이 실행됩니다.

## 숙제 제출 방법

`evaluator.ml` 파일에 있는 `reduce` 함수를 완성하시고 그 파일만 제출해 주세요.
