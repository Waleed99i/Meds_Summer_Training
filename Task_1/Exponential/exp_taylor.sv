module exp_taylor #(parameter int N_TERMS = 20)(
    input  logic clk,
    input  logic rst,
    input  logic start,
    input  real  x,
    output logic done,
    output real  result
);

    real term, sum;
    int i;

    typedef enum logic [1:0] {
        IDLE, CALC, DONE
    } state_t;

    state_t state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state  <= IDLE;
            result <= 0.0;
            sum    <= 0.0;
            term   <= 1.0;
            i      <= 1;
            done   <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        sum    <= 1.0;
                        term   <= 1.0;
                        i      <= 1;
                        done   <= 0;
                        state  <= CALC;
                    end
                end
                CALC: begin
                    term   <= term * x / i;
                    sum    <= sum + term;
                    i      <= i + 1;
                    if (i == N_TERMS) begin
                        result <= sum + term * x / i; // one last term
                        state  <= DONE;
                    end
                end
                DONE: begin
                    done  <= 1;
                    state <= IDLE;
                end
		default: begin
                    state <= IDLE; // Safe fallback
                end
            endcase
        end
    end
endmodule

