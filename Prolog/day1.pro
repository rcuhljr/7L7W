wrote('Gene Wolfe','The Shadow of the Torturer').
wrote('Gene Wolfe','The Claw of the Coniliator').
wrote('Orson Scott Card','Ender\'s Game').
wrote('Robert Jordan','The Eye of the World').
wrote('Robert Jordan','The Great Hunt').
wrote('Glen Cook','The Black Company').

plays('Tomas Haake', drums).
plays('Alexi Laiho', guitar).
plays('John Campbell', bass).
plays('Michael Romeo', guitar).


genre('John Campbell', groove_metal).
genre('Tomas Haake', math_metal).
genre('Alexi Laiho', melodic_death_metal).
genre('Michael Romeo', progressive_metal).

used_in(X,Y) :- plays(Z,X), genre(Z,Y).