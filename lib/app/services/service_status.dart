enum ServiceStatus {
  loading,
  done,
  timedOut,
  error,
  expiredToken,
}

extension ServiceStatusExt on ServiceStatus? {
  isLoading() {
    return this == ServiceStatus.loading;
  }

  isNotLoading() {
    return this != ServiceStatus.loading;
  }

  isDone() {
    return this == ServiceStatus.done;
  }

  isTimedOut() {
    return this == ServiceStatus.timedOut;
  }

  isError() {
    return this == ServiceStatus.error;
  }
}
