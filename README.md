# 토마토 잎 병해 분류를 위한 최소 라벨 데이터 활용: YOLOv8 기반 재귀적 학습 방식

이 프로젝트는 클래스 불균형 문제를 극복하고 최소한의 라벨링 데이터만을 사용하여 토마토 잎의 병해를 효과적으로 분류하기 위한 새로운 방법론을 제안합니다. YOLOv8 모델을 기반으로 한 재귀적 학습 방식을 통해, 학습 데이터의 예측 결과를 다시 학습 데이터로 활용함으로써 데이터 불균형 문제를 근본적으로 해결하고자 합니다.

## 주요 특징

- **클래스 불균형 해결**: 기존 데이터 증강 및 샘플링 방법과 달리, 실제 라벨 데이터 활용을 극대화하여 클래스 불균형 문제에 대응합니다.
- **재귀적 학습 방식**: YOLOv8 모델을 사용하여 학습 데이터에 대한 예측 결과를 다시 학습에 활용, 점진적으로 클래스 개수를 증가시킵니다.
- **고정확도 달성**: 본 방법론을 통해 98.92%의 높은 정확도로 토마토 잎 병해를 분류할 수 있었습니다.
- **실용적 응용 가능성**: 이 연구는 다른 작물의 병해 분류에도 적용될 수 있는 방법론을 제시합니다.

## 사용 방법

본 섹션에서는 프로젝트 설정, 데이터 준비 및 모델 학습과 평가까지의 과정을 안내합니다.

### 필수 요구 사항

- Python 3.x
- PyTorch
- OpenCV
- 기타 필요한 패키지는 `requirements.txt` 참조

### 설치

```bash
git clone <이 프로젝트의 GitHub URL>
cd <프로젝트 디렉터리>
pip install -r requirements.txt

## 중심어

-  클래스 불균형, 재귀적 학습, YOLOv8, EfficientNet, 토마토 병해
