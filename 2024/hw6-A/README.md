# HW6: SM5 (Stack Machine 5)

## How to use

1. 구현한 `translator.ml`을 복사하거나 뼈대코드 `translator.ml.orig`을 `translator.ml`로 바꾼 후 구현합니다.
2. 구현한 `machine.ml`을 복사하거나 뼈대코드 `machine.ml.orig`을 `machine.ml`로 바꾼 후 구현합니다.
3. `./check` 명령어를 통해 테스트케이스를 실행합니다.

## Test Cases

### 6-1

- `examples/test<num>.k--` : 테스트케이스
- `examples/test<num>.in`  : 입력
- `examples/test<num>.ans` : 정답
- `examples/test<num>.out` : 출력

### 6-2

- `gc_test.ml` 안에 테스트케이스들이 있습니다.

---

>SNU 4190.310 Programming Languages

# SM5

## 컴파일 및 실행 방법

`machine.ml`에는 SM5 기계가 정의되어 있고, `k.ml`에는 K-- 인터프리터가 구현되어 있습니다. 아래와 같이 실행하면, 주어진 K-- 프로그램을 여러분이 작성하신 번역기에 따라 번역하고 SM5 기계로 실행합니다.

```sh
λ dune build --release
λ ./_build/default/bin/main.exe examples/test1.k--
```

혹은 정의된 `run` 링크를 사용하여

```sh
λ ./run examples/test1.k--
```

## K-- 문법 나무 출력하기

주어진 K-- 프로그램의 문법 나무를 화면에 출력해주는 모듈이 `pp.ml` 파일에 포함되어 있습니다. 이를 통해 파싱이 의도한대로 되고 있는지 확인해보실 수 있습니다.

```sh
λ ./run -pk examples/test1.k--
```

## K-- 실행기로 실행하기

주어진 K-- 프로그램을 K-- 실행기로 실행한 결과를 다음과 같이 확인할 수 있습니다.
번역이 제대로 되었다면, SM5 기계로 실행한 결과와 K-- 실행기로 실행한 결과가 같아야 합니다.

```sh
λ ./run -k examples/test1.k--
```

## 번역된 SM5 프로그램 출력하기

주어진 K-- 프로그램을 SM5로 번역한 결과를 `-psm5` 옵션을 통해 출력할 수 있습니다.

```sh
λ ./run -psm5 examples/test1.k--
```

## SM5 기계 위에서 디버그 모드로 실행하기

주어진 K-- 프로그램을 SM5로 번역한 다음, 디버그 모드에서 실행합니다. 디버그 모드는 SM5의 매 단계마다 기계 상태를 출력합니다. 출력되는 문자열의 양이 많으므로 주의하세요.

```sh
λ ./run -debug examples/test1.k--
```

## GC가 달린 SM5로 실행하기

주어진 K-- 프로그램을 SM5로 번역한 다음, GC가 장착된 SM5 기계 위에서 실행합니다.

```sh
λ ./run -gc examples/test1.k--
```

## 숙제 제출 방법

1. SM5 문제는 `translator.ml` 파일 안 `trans` 함수를 완성한 후, `translator.ml` 파일만 제출해주세요.
2. SM5 Limited 문제는 `machine.ml` 안 `malloc_with_gc` 함수를 완성한 후, `machine.ml` 파일만 제출해주세요.

---
최웅식 <wschoi@ropas.kaist.ac.kr>
신재호 <netj@ropas.snu.ac.kr>
김덕환 <dk@ropas.snu.ac.kr>
오학주 <pronto@ropas.snu.ac.kr>
박대준 <pudrife@ropas.snu.ac.kr>
이희종 <ihji@ropas.snu.ac.kr>
정영범 <dreameye@ropas.snu.ac.kr>
최원태 <wtchoi@ropas.snu.ac.kr>
허기홍 <khheo@ropas.snu.ac.kr>
조성근 <skcho@ropas.snu.ac.kr>
최준원 <jwchoi@ropas.snu.ac.kr>
강동옥 <dokang@ropas.snu.ac.kr>
최재승 <jschoi@ropas.snu.ac.kr>
이동권 <dklee@ropas.snu.ac.kr>
배요한 <yhbae@ropas.snu.ac.kr>
이재호 <jhlee@ropas.snu.ac.kr>
