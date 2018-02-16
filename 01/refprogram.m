function refprogram()
    %% Running the row echelon form code
    A = [0 2 8 -7; 2 -2 4 0; -3 4 -2 -5]
    ref(A)
end

function A = ref(A)
    A = sym(A);
    rows_num = size(A, 1);
    cols_num = size(A, 2);
    pivot = 1;
    
    for cur_row = 1:rows_num - 1
        if pivot > cols_num
            break
        end
        
        % replace if necessary
        check = cur_row;
        while A(check, pivot) == 0
           if check == rows_num
                if pivot == cols_num
                    break
                end
                
                check = cur_row;
                pivot = pivot + 1;
           end
           check = check + 1;
        end
        
        if check ~= cur_row
            temp = A(check,:);
            A(check,:) = A(cur_row,:);
            A(cur_row,:) = temp;
        end
        
        % remove lower values
        for lower = cur_row+1:rows_num
            if A(lower, pivot) == 0
                continue
            end
            
            ratio = A(cur_row,pivot)/A(lower,pivot);
            A(lower,:) = A(lower,:)*ratio - A(cur_row,:);
        end
        
        pivot = pivot + 1;
    end
    
    % make pivots one
    pivot = 1;
    for cur_row = 1:rows_num
        while 1
            if pivot > cols_num
                break
            end
            
            if A(cur_row, pivot) ~= 0
                A(cur_row,:) = A(cur_row,:)/A(cur_row,pivot);
                break
            end
            
            pivot = pivot + 1;
        end
        
        if pivot > cols_num
            break
        end
    end
end