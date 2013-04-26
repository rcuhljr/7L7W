(defn big [string n] (> (count string) n))

(defn collection-type [col] (let 
	[typemap {(class '()) :list, (class '(1)) :list, (class []) :vector, (class {}) :map}
	 coltype (class col)] 
		(typemap coltype)
		))