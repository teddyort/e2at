classdef symss
    %SYMSS A state-space representation of a system with A,B,C,D matrices.
    %   Similar to ss(A,B,C,D) but allows symbolic matrices
    
    properties
        A
        B
        C
        D
    end
    
    methods
        function sys = symss(A,B,C,D)
            sys.A = A;
            sys.B = B;
            sys.C = C;
            sys.D = D;
        end
        
        function disp(sys)
            disp('A:');disp(sys.A);disp('');
            disp('B:');disp(sys.B);disp('');
            disp('C:');disp(sys.C);disp('');
            disp('D:');disp(sys.D);disp('');
        end
        
        function [A,B,C,D] = abcd(sys)
            A = sys.A;
            B = sys.B;
            C = sys.C;
            D = sys.D;
        end
    end
    
end

