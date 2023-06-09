# 230331 DB
데이터 모델링의 순서와 정규화 UML 관련 내용
## 데이터 모델링
---
데이터 모델링의 순서
1. 업무파악/요구사항 분석
2. 개념적 모델링
    ```
    ERD (Entity Relational Diagram)
    Entity : □
    Attribute : ○
    Relation : ◇
    ```
    - 요구사항 내에 개별 개체(Entity)가 어떤 것이 있는지 파악이 중요

3. 논리적 데이터 모델링
    - 개념적 구조를 컴퓨터 처리 가능한 상태로 변환하는 과정
    - 물리적 데이터 모델링 전에 정규화 구성

4. 물리적 데이터 모델링

<br>

## Normalization 정규화
---
이상현상이 있는 릴레이션을 분해하는데   
무조건적으로 정규화가 좋다고 할 수는 없음.  
join연산이 많아져 다시 릴레이션을 합치는 과정을 역정규화 혹은 반정규화라고 함.

```
제 1정규화
            1. 각 컬럼은 하나의 속성만을 가져야 한다.
            2. 하나의 컬럼마다 같은 종류(타입)의 값을 가져야 한다.
            3. 각 컬럼의 이름은 유일한 값을 가져야 한다.
            4. 칼럼의 순서가 상관없어야 한다.
```
```
제 2정규화 
            1. 제 1정규화의 조건을 모두 만족해야 한다.
            2. 모든 컬럼은 부분적 종속이 없어야 한다.
                = 모든 컬럼은 완전 함수 종속을 만족해야 한다.
        
        부분적 종속이란 : 기본키 중 특정 컴럼에만 종속
```
```
제 3정규화 
            1. 제 2정규화의 조건을 만족해야 한다.
            2. 기본키를 제외한 속성들 간의 이행 종속성이 없어야 한다.
        
        이행 종속성이란 : X→Y이고 Y→Z 이면 X→Z이다.
```
```
BCNF(Boyce-Codd Normal Form)
            1. 제 3정규화의 조건을 만족해야 한다.
            2. 모든 결정자가 후보키 집합에 속해야 한다.
```
```
제 4정규화 
            1. BCNF의 조건을 만족해야 한다.
            2. 다치 종속이 없어야 한다.
        
        다치 종속이란 : A->B 인데 B가 여러개의 값이면 다치 종속이라 함.
```
```
제 5정규화 
            1. 제 4정규화의 조건을 만족해야 한다.
            2. 조인 종속이 없어야 한다.
            3. 조인 연산을 했을 때 손실이 없어야 한다.
        
        조인 종속이란 A라는 릴레이션을 B와 C로 분리하고 다시 조인했을 때 A가 되는 것을 말함.
```

## UML
---
> Unified Modeling Language 의 약자로 통합 모델링 언어이며, 프로그래밍 언어는 아니다!

개발을 하기 전 다이어그램을 통해 프로그램의 전체적인 설계, 필요한 변수나 함수를 정하고 어떤 로직으로 어떻게 동작하는지 등 전반적인 계획이나 틀을 잡아 시각화 하는 것임.

<br>

### - E-R 다이어그램 (Entity-Relationship Diagram)
E-R 다이어그램, ERD는 DB를 물리적으로 구축하기 전에 어떠한 엔티티들이 있으며 내부 속성 값과 도메인이 어떻게 적용하는지를 정리하고 엔티티들 간의 작용이 어떻게 이루어지는지를 나타내는 관계 도표

ERD 범례
<img src="https://blog.kakaocdn.net/dn/kCnHv/btqLW8LRGpN/IDARbgYYD5WmA7wfo7m2y1/img.gif">