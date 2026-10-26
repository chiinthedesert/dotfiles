;; ~/.config/nvim/queries/typst/textobjects.scm

;; 1. HEADINGS (Title line only)
(heading) @heading.outer
(heading (_) @heading.inner)

;; 2. SECTIONS (Full section container)
(section) @section.outer
(section (content) @section.inner)

;; 3. MATH FORMULAS ($ ... $)
(math) @math.outer
(math (_) @math.inner)

;; 4. CODE & RAW BLOCKS
(code) @code.outer
(raw_blck) @code.outer
(raw_span) @code.outer

;; 5. FUNCTIONS & CALLS
(let) @function.outer
(call) @call.outer
(call (_) @call.inner)

;; 6. PARAMETERS / ARGUMENTS
(group (_) @parameter.inner)
