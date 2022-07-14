resource "kubernetes_namespace" "challenge" {
  metadata {
    annotations = {
      name = "challenge-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "challenge"
  }
}