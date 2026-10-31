from kitty.boss import Boss
from kittens.tui.handler import result_handler


def main(args: list[str]) -> None:
    pass

@result_handler(no_ui=True)
def handle_result(
    args: list[str],
    answer: str,
    target_window_id: int,
    boss: Boss,
) -> None:
    n = int(args[1])
    if n < 1:
        return

    tm = boss.active_tab_manager
    if tm is None:
        return

    idx = n - 1
    while len(tm.tabs) <= idx:
        tm.new_tab()

    tm.set_active_tab_idx(idx)
