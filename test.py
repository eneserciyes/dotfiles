from dataclasses import dataclass
from random import randint


@dataclass
class Wizard:
    name: str
    mana: int = 100

    def cast(self, spell: str) -> str:
        cost = randint(5, 30)
        if cost > self.mana:
            raise RuntimeError(f"{self.name} is out of mana")

        self.mana -= cost
        return f"{self.name} casts {spell}! ({self.mana} mana left)"


def main() -> None:
    wizard = Wizard("Ada")
    spells = ["Fireball", "Frost Nova", "Polymorph"]

    for spell in spells:
        print(wizard.cast(spell))


if __name__ == "__main__":
    main()
