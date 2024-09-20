 function algorithme_genetique_eggholder()
     taille_population = 5;
    n_generations = 2;
    taux_mutation = 0.02;

     population = initialiser_population(taille_population);

    for generation = 1:n_generations
        fitness = evaluer_population(population);
        population = evoluer_population(population, fitness, taux_mutation);

         if mod(generation, 100) == 0
            meilleur_fitness = max(fitness);
            disp(['Geração: ', num2str(generation), ' - Melhor fitness: ', num2str(meilleur_fitness)]);
        end
    end

     afficher_meilleur(population);
end

function population = initialiser_population(taille)
    population = randi([0, 1], taille, 60);
end

function fitness = evaluer_population(population)
    fitness = zeros(size(population, 1), 1);
    for idx = 1:size(population, 1)
        [x, y] = decode(population(idx, :));
        fitness(idx) = -eggholder(x, y);
    end
end

function population = evoluer_population(population, fitness, taux_mutation)
    parents = selection_tournoi(population, fitness);
    descendants = croisement(parents);
    population = [parents; muter(descendants, taux_mutation)];
end

function f = eggholder(x, y)
    f = -(y + 47) * sin(sqrt(x^2 + y + 47)) - x * sin(sqrt(x - (y + 47)));
end

function [x, y] = decode(individu)
    bits_x = individu(1:30);
    bits_y = individu(31:60);

    %  aqui foi para eu converter um número decimal e escala para [0, 1000]
    x = bin2dec(num2str(bits_x)) / (2^30 - 1) * 1000;
    y = bin2dec(num2str(bits_y)) / (2^30 - 1) * 1000;
end

function parents = selection_tournoi(population, fitness)
    n = size(population, 1);
    parents = zeros(size(population));

    for i = 1:n
        concorrents = randi(n, 1, 2);
        [~, index_vainqueur] = max(fitness(concorrents));
        parents(i, :) = population(concorrents(index_vainqueur), :);
    end
end

function descendants = croisement(parents)
    n = size(parents, 1);
    descendants = zeros(n, 60);

    for i = 1:2:n-1
        point_croisement = randi(59);
        descendants(i, :) = [parents(i, 1:point_croisement), parents(i+1, point_croisement+1:end)];
        descendants(i+1, :) = [parents(i+1, 1:point_croisement), parents(i, point_croisement+1:end)];
    end
end

function mutes = muter(descendants, taux_mutation)
    mutes = descendants;
    for i = 1:size(mutes, 1)
        for j = 1:size(mutes, 2)
            if rand() < taux_mutation
                mutes(i, j) = 1 - mutes(i, j); % importante!!! para inverter o bit
            end
        end
    end
end

function afficher_meilleur(population)
    fitness = evaluer_population(population);
    meilleur_index = find(fitness == max(fitness), 1);
    meilleur_individu = population(meilleur_index, :);
    [x, y] = decode(meilleur_individu);
    meilleur_valeur = -eggholder(x, y);

    disp(['Melhor x: ', num2str(x), ', Melhor y: ', num2str(y), ', Valor: ', num2str(meilleur_valeur)]);
end

 algorithme_genetique_eggholder();


