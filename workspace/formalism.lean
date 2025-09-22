```lean
/- Уровень 2: Протоарифметика - формализация в Lean -/

inductive ProtoTerm : Type where
  | epsilon : ProtoTerm                    -- Константа ε
  | symbolA : ProtoTerm                    -- Константа A
  | concat : ProtoTerm → ProtoTerm → ProtoTerm  -- Операция конкатенации ∘
  | var : String → ProtoTerm               -- Переменные (x, y, z...)

notation "ε" => ProtoTerm.epsilon
notation "A" => ProtoTerm.symbolA
infixl:70 " ∘ " => ProtoTerm.concat

-- Аксиомы протоарифметики как утверждения на языке Lean
axiom concat_neq_A : ∀ (s : ProtoTerm), (s ∘ A) ≠ s
axiom epsilon_neq_A : ε ≠ A
axiom left_cancellation : ∀ (s t u : ProtoTerm), (s ∘ t = s ∘ u) → (t = u)
axiom associativity : ∀ (s t u : ProtoTerm), s ∘ (t ∘ u) = (s ∘ t) ∘ u
```