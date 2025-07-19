import numpy as np
from fl.aggregators import aggregator_mean
from fl.types import Matrix, List, Callable, Union
from fl.model import Sequential, train_and_test, test


def federated(
        model: Sequential,
        x_clients: List[Matrix[np.float_]],
        y_clients: List[Matrix[np.float_]],
        x_test: Matrix[np.float_],
        y_test: Matrix[np.float_],
        fl_iterations: int,
        nb_adv: int = 0,
        custom_train_and_test: Callable = train_and_test,
        client_epochs: int = 1,
        adam_lr: float = 0.001
) -> dict[str, Union[Sequential, List[np.float_], float]]:
    acc_fl = []
    fl_weights = None
    acc = 0
    model_fl = model

    for i in range(fl_iterations):
        print(f"Federated learning iteration: {i + 1}")

        weights_list = []
        for j in range(len(x_clients)):
            model_client = model
            if i > 0:
                model_client.set_weights(fl_weights)

            args = (
                model_client,
                x_clients[j],
                y_clients[j],
                x_test,
                y_test,
                client_epochs,
                0,
                adam_lr
            )
            print(f"Client {j}:")
            if j < nb_adv:
                model_client_results = custom_train_and_test(*args)
            else:
                model_client_results = train_and_test(*args)

            weights_list.append(
                model_client_results["weights"]
            )

        fl_weights = aggregator_mean(weights_list)

        model_fl = model
        model_fl.set_weights(fl_weights)

        acc = test(model_fl, x_test, y_test)
        acc_fl.append(acc)
        print(f"Federated Accuracy: {acc:.3f}")

    return {
        "model": model_fl,
        "weights": model_fl.get_weights(),
        "history_acc": acc_fl,
        "acc": acc
    }
